From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Jan 2021 23:29:45 +0100
Subject: [Buildroot] [git commit] package/trace-cmd: installs nothing in
 staging/
In-Reply-To: <20210103200946.C2D7586189@busybox.osuosl.org> (Yann E. MORIN's
 message of "Sun, 3 Jan 2021 21:26:29 +0100")
References: <20210103200946.C2D7586189@busybox.osuosl.org>
Message-ID: <87lfd73tly.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit:
 > https://git.buildroot.net/buildroot/commit/?id=896b93310a2e5f5945f3b792296a05be0373269f
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Since its introduction in Buildroot in 2013 with commit 07203d78c24d
 > (trace-cmd: new package), trace-cmd has declared installing in staging.

 > But trace-cmd is a generic-package, and has never, ever provided any
 > commands for staging installation.

 > Drop this declaration.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
