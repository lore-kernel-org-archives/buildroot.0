From: Carlos Santos <casantos@datacom.com.br>
Date: Fri, 14 Dec 2018 23:46:31 -0200 (BRST)
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-12-13
In-Reply-To: <20181214070028.28AC620DDA@mail.bootlin.com>
References: <20181214070028.28AC620DDA@mail.bootlin.com>
Message-ID: <543443774.3025390.1544838391325.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> To: "Carlos Santos" <casantos@datacom.com.br>
> Sent: Sexta-feira, 14 de dezembro de 2018 5:00:28
> Subject: [autobuild.buildroot.net] Your build results for 2018-12-13

> Build failures related to your packages:
> 
>        i686 |               pcm-tools-201812 | http://autobuild.buildroot.net/results/cf3c79f0c94be8a184d532570bdb1893090316a3

Fixed by https://patchwork.ozlabs.org/patch/1013797/

>      xtensa |                util-linux-2.33 | http://autobuild.buildroot.net/results/12b108a6185ab96a0eb509ab0e6fe053e545c77b

I can't reproduce it locally. Looks like a host glitch, since fails in
the installation.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
