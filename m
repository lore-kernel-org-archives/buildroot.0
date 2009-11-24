From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Nov 2009 13:23:18 -0300
Subject: [Buildroot] [PATCH] Add fuse-sshfs package
In-Reply-To: <20091124160326.GX14091@buzzloop.caiaq.de>
References: <1259073650-3843-1-git-send-email-daniel@caiaq.de>
	<4B0BFF55.2090805@zacarias.com.ar>
	<87my2bdihl.fsf@macbook.be.48ers.dk>
	<20091124160326.GX14091@buzzloop.caiaq.de>
Message-ID: <4B0C0876.8020405@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Daniel Mack wrote:

> Ok, will resend. But this is not a build-time dependency, so I'd say
> adding BR_PACKAGE_OPENSSH to Config.in will suffice. And I wouldn't add
> DROPBEAR there, as I didn't test that.
> 
> Daniel

Right, did a quick test here and it doesn't seem to be happy about using
dbclient so openssh sounds right.
Regards.
