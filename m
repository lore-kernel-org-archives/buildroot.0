From: Jaap Crezee <jaap@jcz.nl>
Date: Thu, 27 Aug 2015 14:49:15 +0200
Subject: [Buildroot] [PATCH] pacakge/qt5/qt5base: fix build with ccache
In-Reply-To: <55DED48F.3030102@wsystem.com>
References: <1440499298-39957-1-git-send-email-benoit@wsystem.com>
 <20150826154534.3e67c9bc@free-electrons.com>
 <CA+sos7-LVKNjkVc+1hg0w8WZMGEtnthaJnaA7-fUKEOizjJCeg@mail.gmail.com>
 <55DEC67C.6000500@wsystem.com> <20150827105450.100164af@free-electrons.com>
 <55DED48F.3030102@wsystem.com>
Message-ID: <55DF074B.7080408@jcz.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,


On 08/27/15 11:12, Beno?t Th?baudeau wrote:
> OK, but in the meantime, until we have a wrapper for the internal toolchain too,
> what do you want to do to fix the current build failure?
>  - Forbid the use of ccache with Qt 5?

I would not recommend that. Qt5base is *huge* and recompiling it over and over again (as I
do when I am developing with/against buildroot) is just too time consuming.

>  - Use the current patch?

You can also look at one of my previous patches (see list archive). I simply don't have
the time to respond to all correction requests unfortunately.


Regards,


Jaap Crezee
