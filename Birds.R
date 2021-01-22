#Ejercicio: Multivariate analyses in R
#By C Nell

#Types of questions
#Do groups differ in composition?
#  Does community structure vary among regions or over time?
#  Do environmental variables explain community patterns?
#  Which species are responsible for differences among groups?

#install.packages('vegan')
library(vegan) ##Community ecology: ordination, disversity & dissimilarities
library(readr)
library(ggplot2)

###Dataset info
#Bird abundances from 32 different plots (rows), 12 of which have 1 tree species 
#(DIVERSITY = M) and 20 with 4 tree species (DIVERSITY = P).

#Tree composition: there are a total of 6 possible tree species (treecomp), each 
#signified with a letter A to F. Bird abundances are totalled according to their 
#feeding guild (columns).


###Paso 1: Importación de datasets
#aves
birds <- read_csv("C:/Users/Rose/Documents/ESTADISTICA/Proyectos/Bird_abundances/bird_by_fg.csv")
View(birds)
head(birds)
tail(birds)

#arboles
trees <- read_csv("C:/Users/Rose/Documents/ESTADISTICA/Proyectos/Bird_abundances/tree_comp.csv")
head(trees)

###QUESTIONS: Is C. pentandara (B) associated with variation in bird species 
#composition? Does feeding guild composition differ between monoculture and 
#polyculture plots?

###MANOVA (MULTIVARIATE ANALYSIS OF VARIANCE)
#parametric test for differences between independent groups for multiple continuous 
#dependent variables. Like ANOVA for many response variables. Requires variables to
#be fewer than number of samples.

#Is C.pentandra (B)associated with variation in bird species composition? Or D & F 
#(both Fabaceae)?
birds.matrix <- as.matrix(birds[,3:9])#response variables in a sample X species matrix
trees$B <- as.factor(trees$B)

birds.manova <- manova(birds.matrix ~ as.factor(B), data= trees) #manova test
summary(birds.manova)

#show univariate results
summary.aov(birds.manova)

#Assumptions of MANOVA
# 1. normal distribution
# 2. linearity
# 3. homogeneity of variances
# 4. homogeneity of covariances

# PROBLEM: most ecological data is overdispersed, has many 0's or rare species,
#unequal sample sizes.
# SOLUTION: dissimilarity coefficients, permutation test

###PERMANOVA (PERMUTATIONAL MULTIVARIATE ANALYSIS OF VARIANCE)
#non-parametric, based on dissimilarities. Allows for partitioning of variability
#similar to ANOVA, allowing foro complex design (multiple factors, nested design,
#interactions, covariates). Uses permutation to compute F-statistic (pseudo-F).

#Null hypothesis: groups do not differ in spread or position n multivariate space.

# 1. Transform or standarize data

# 2. Calculate ecological resemble

# 3. perMANOVA

# 4. Multivariate dispersion







