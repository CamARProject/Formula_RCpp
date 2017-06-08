
f <- file("C:/Users/健太郎/Documents/Visual Studio 2015/Projects/CamAR/Release//formula.txt", "r")
z <- readLines(f)
z_arg_xy <- parse(text = z[1])
dzdx <- D(z_arg_xy, "x")
dzdy <- D(z_arg_xy, "y")
close(f)


write.table(NULL, "C:/Users/健太郎/Documents/Visual Studio 2015/Projects/CamAR/Release/output_vy.txt", quote = F, col.names = F, append = F)
write.table(NULL, "C:/Users/健太郎/Documents/Visual Studio 2015/Projects/CamAR/Release/output_ny.txt", quote = F, col.names = F, append = F)
write.table(NULL, "C:/Users/健太郎/Documents/Visual Studio 2015/Projects/CamAR/Release/output_vz.txt", quote = F, col.names = F, append = F)
write.table(NULL, "C:/Users/健太郎/Documents/Visual Studio 2015/Projects/CamAR/Release/output_nz.txt", quote = F, col.names = F, append = F)
write.table(NULL, "C:/Users/健太郎/Documents/Visual Studio 2015/Projects/CamAR/Release/output_vx.txt", quote = F, col.names = F, append = F)
write.table(NULL, "C:/Users/健太郎/Documents/Visual Studio 2015/Projects/CamAR/Release/output_nx.txt", quote = F, col.names = F, append = F)

for (i in 0:40) 
 {


        j <- 0:40


        A1 <- i / 10 - 2
        A2 <- j / 10 - 2

        z1 <- eval(dzdx, list(x = A1, y = A2))

        z2 <- eval(dzdy, list(x = A1, y = A2))


        xgaiseki <- 0 * z2 - z1 * 1
        ygaiseki <- z1 * 0 - 1 * z2
        zgaiseki <- 1 * 1 - 0 * 0

        r <- sqrt(xgaiseki ^ 2 + ygaiseki ^ 2 + zgaiseki ^ 2)

        vx <- A1 * 20
        vy <- A2 * 20
        vz <- (eval(z_arg_xy, list(x = A1, y = A2)) * 20)

        v <- c(vx, vy, vz)
        write.table(vy, "C:/Users/健太郎/Documents/Visual Studio 2015/Projects/CamAR/Release/output_vy.txt", quote = F, row.names = F, col.name = F, append = T)
        write.table(vz, "C:/Users/健太郎/Documents/Visual Studio 2015/Projects/CamAR/Release/output_vz.txt", quote = F, row.names = F, col.name = F, append = T)
        write.table(vx, "C:/Users/健太郎/Documents/Visual Studio 2015/Projects/CamAR/Release/output_vx.txt", quote = F, row.names = F, col.name = F, append = T)

        nx <- (-1 * (z1 / r))
        ny <- (-1 * (z2 / r))
        nz <- 1 / r

        n <- c(nx, ny, nz)

        write.table(ny, "C:/Users/健太郎/Documents/Visual Studio 2015/Projects/CamAR/Release/output_ny.txt", quote = F, row.names = F, col.name = F, append = T)
        write.table(nx, "C:/Users/健太郎/Documents/Visual Studio 2015/Projects/CamAR/Release/output_nz.txt", quote = F, row.names = F, col.name = F, append = T)
        write.table(nz, "C:/Users/健太郎/Documents/Visual Studio 2015/Projects/CamAR/Release/output_nx.txt", quote = F, row.names = F, col.name = F, append = T)



        #cat("\n")
    }
