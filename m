From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon, 6 Nov 2017 22:19:55 -0200 (BRST)
Subject: [Buildroot] [PATCH] util-linux: fix link failures due to name
 clash
In-Reply-To: <1510010041-4377-1-git-send-email-luca@lucaceresoli.net>
References: <1510010041-4377-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1111696854.16420170.1510013995647.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Luca Ceresoli" <luca@lucaceresoli.net>
> To: buildroot at buildroot.org
> Cc: "Luca Ceresoli" <luca@lucaceresoli.net>, "Adam Duskett" <aduskett@gmail.com>
> Sent: Monday, November 6, 2017 9:14:01 PM
> Subject: [Buildroot] [PATCH] util-linux: fix link failures due to name clash

> Several packages have a similar md5.c file, and each has a function
> named byteReverse(). This generates link errors ("multiple definition
> of `byteReverse'").
> 
> Fix by declaring byteReverse as static, since it is just an internal
> function.
> 
> Fixes:
>  http://autobuild.buildroot.net/results/419ab2c0e034cc68991281c51caa8271b0fadbab/

Did you submit this patch upstream?

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
