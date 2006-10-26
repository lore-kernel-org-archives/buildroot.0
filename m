From: Fredrik Roubert <fredrik.roubert@barco.com>
Date: Thu, 26 Oct 2006 11:33:27 +0200
Subject: [Buildroot] ERROR: ccache says "(No such file or directory)" !!!
In-Reply-To: <E55CA8ECFBA85E4CB8E8173566B9EFEB287B3F@rennsmail04.eu.thmulti.com>
References: <E55CA8ECFBA85E4CB8E8173566B9EFEB287B3F@rennsmail04.eu.thmulti.com>
Message-ID: <20061026093327.GK8626@igloo.df.lth.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed 25 Oct 17:37 CEST 2006, Paugam Luc wrote:

> It seems that ccache keep the information of the build directory path! I
> am wondering why? It does not allow to install the toolchain in other
> environment system.

In order to build a cross compiler that you can use outside of the build
environment, you need to first apply Ed Swierk's patch to buildroot:

http://www.busybox.net/lists/buildroot/2006-July/000027.html

I don't know why the default behaviour is the way it is, but I would
really like to know if there is a good reason for it. See:

http://www.busybox.net/lists/buildroot/2006-October/000260.html
http://www.busybox.net/lists/buildroot/2006-October/000333.html

Cheers // Fredrik Roubert

-- 
Barco Medical Imaging          |  +32 56 233549
http://www.barco.com/medical/  |  fredrik.roubert at barco.com
