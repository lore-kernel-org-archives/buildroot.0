From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Oct 2017 23:11:17 +0100
Subject: [Buildroot] Unable to build an image with systemd
In-Reply-To: <CAJCNcEb4+FOpcFD7ES6EHGtwWegY3WLxtFc6SsOS-ziY3dg-7g@mail.gmail.com>
 (Gorka Lertxundi's message of "Mon, 30 Oct 2017 16:14:21 +0100")
References: <CAJCNcEb8aemsJ3YrRwK78mv_XTAOsTx54mWaGBoy22uF6zAynA@mail.gmail.com>
 <20171030153510.35066d4a@windsurf>
 <CAJCNcEb4+FOpcFD7ES6EHGtwWegY3WLxtFc6SsOS-ziY3dg-7g@mail.gmail.com>
Message-ID: <87she0i8vu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gorka" == Gorka Lertxundi <glertxundi@gmail.com> writes:

Hi,

 > I started taking the customizations from jumpnow (
 > https://github.com/jumpnow/buildroot) and include them one-by-one on the
 > original buildroot but when I changed from sysv to systemd this one failed
 > to build.

Just to be sure - You did a make clean when you changed from sysv to
systemd, right?

-- 
Bye, Peter Korsgaard
