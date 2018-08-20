From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Aug 2018 19:22:58 +0200
Subject: [Buildroot] [PATCH] liburiparser: bump to version 0.8.6
In-Reply-To: <20180820001208.10551-1-casantos@datacom.com.br> (Carlos Santos's
 message of "Sun, 19 Aug 2018 21:12:08 -0300")
References: <20180820001208.10551-1-casantos@datacom.com.br>
Message-ID: <87sh392brh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.com.br> writes:

 > Version 0.8.6 is a bugfix release including a nasty bug that has
 > potential to crash applications when parsing certain URIs (like
 > "//:%aa@", excluding quotes).

 > For more details please check the change log at

 >     https://github.com/uriparser/uriparser/blob/uriparser-0.8.6/ChangeLog

 > Signed-off-by: Carlos Santos <casantos@datacom.com.br>

Committed, thanks.

When was this issue introduced? 2018.02.x has 0.8.4.

-- 
Bye, Peter Korsgaard
