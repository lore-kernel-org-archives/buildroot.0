From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 14 Oct 2014 09:41:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/mpd: bump to version 0.19
In-Reply-To: <543B82B8.1040207@posteo.de> (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Mon, 13 Oct 2014 09:43:52 +0200")
References: <1413141057-21530-1-git-send-email-jkrause@posteo.de>
 <20141012214016.04260709@free-electrons.com>
 <543B82B8.1040207@posteo.de>
Message-ID: <87siirqerr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <jkrause@posteo.de> writes:

Hi,

 >>> +	default y
 >> Any reason to enable it by default?

 > Unicode support is enabled by default in mpd configure. It has to be
 > disabled by the user. I just wanted to be consistent in the sense of
 > the mpd configure file.

We normally try to keep the buildroot configuration as minimal as
possible by default. If mpd works sanely without unicode, then this
shouldn't be enabled by default.

-- 
Bye, Peter Korsgaard
