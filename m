From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Nov 2017 23:53:59 +0100
Subject: [Buildroot] [PATCH 1/3] package/dvb-apps: fix build with some
 perl version
In-Reply-To: <3756298044e002e93aa851a58b8337e6f676c91a.1511779719.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 27 Nov 2017 11:48:54 +0100")
References: <cover.1511779719.git.yann.morin.1998@free.fr>
 <3756298044e002e93aa851a58b8337e6f676c91a.1511779719.git.yann.morin.1998@free.fr>
Message-ID: <87mv379vug.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > perl can't find a module that is located in the current directory,
 > so help it locate it.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Francois Perrad <francois.perrad@gadz.org>

 > ---
 > Note: I have no idea why perl on my machine does not find that file,
 > while it does on all the autobuilders so far... I just assume that this
 > is a perl version issue, but I may very well be wrong. Fran?ois ?

Committed to 2017.02.x and 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
