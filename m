From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 11 Jan 2015 19:11:12 -0300
Subject: [Buildroot] [PATCH] libpng: add  libpng12
In-Reply-To: <54B2D5CC.3030006@ou.edu>
References: <54B2C5B5.4070703@ou.edu> <54B2D218.2030304@zacarias.com.ar>
 <54B2D5CC.3030006@ou.edu>
Message-ID: <54B2F500.2040206@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/11/2015 04:58 PM, Steve Kenton wrote:

> The freetype support in dvdauthor specifies libpng12
> I'll try changing to libpng16 and see if it works

Keep the list CCed, someone else might be interested.
There's a small patch in gentoo against 0.7.1 that allows libpng15/16
support.
It's a 2-liner and it's probably upstream in git so it's likely better
than creating a new libpng package/variant (avoid complexity and size
penalty).
It would also be interesting if you'd submit the package if you are
succesful.
Regards.
