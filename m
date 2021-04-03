From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Apr 2021 09:33:38 +0200
Subject: [Buildroot] [PATCH] package/perl-parse-yapp: remove useless
 dependencies
In-Reply-To: <20210330090026.2049071-1-francois.perrad@gadz.org> (Francois
 Perrad's message of "Tue, 30 Mar 2021 11:00:26 +0200")
References: <20210330090026.2049071-1-francois.perrad@gadz.org>
Message-ID: <875z13bz59.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Parse-Yapp comes with a Makefile.PL,
 > so it is built with the perl core module ExtUtils-MakeMaker

 > regenerated with `utils/scancpan -force -host Parse-Yapp`

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
