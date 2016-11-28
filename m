From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Mon, 28 Nov 2016 16:12:45 -0500
Subject: [Buildroot] [PATCH v2] package/pseudo: update version
In-Reply-To: <cd4dd4c7-f08b-2256-37ae-916c405938d2@mind.be>
References: <20161127011202.6938-1-gael.portay@savoirfairelinux.com>
 <20161127231918.6a07ab13@free-electrons.com>
 <cd4dd4c7-f08b-2256-37ae-916c405938d2@mind.be>
Message-ID: <20161128211245.vqow7rjd5aadn73h@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Mon, Nov 28, 2016 at 11:40:57AM +0100, Arnout Vandecappelle wrote:
>  Gael, Yann, can you summarize (in a new thread) the reasons to switch to
> pseudo? What possibilities does it give either to the user or to the BR
> developers, which aren't possible now?
> 

I am not sure I am the one who can tell why we should move to pseudo. I was just
helping because pseudo breaks my build (and of course, because I like to bring
by contributions).

BTW, if think Yann has already sent a mail why he think BR should move to
pseudo.

If I remember well the main two reasons are:
 * fakeroot looks like it is not supported anymore (no release since two years)
 * pseudo `works' with SELinux (*)

(Maybe I am wrong.)

*: fakeroot is now working with SELinux since the workaround
http://lists.busybox.net/pipermail/buildroot/2016-November/178238.html
