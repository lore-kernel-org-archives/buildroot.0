From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 07 Jan 2019 08:50:37 +0100
Subject: [Buildroot] [PATCH] package/liburiparser: security bump to
 version 0.9.1
In-Reply-To: <20190106234131.9393-1-casantos@datacom.com.br> (Carlos Santos's
 message of "Sun, 6 Jan 2019 21:41:31 -0200")
References: <20190106234131.9393-1-casantos@datacom.com.br>
Message-ID: <87tvikewj6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.com.br> writes:

 > Fixes an out-of-bounds read, the parsing of some a malformed URIs and a
 > function that reported 1 more byte than actually needed for IPv4 address
 > URIs. For additional datails, see

 >     https://github.com/uriparser/uriparser/blob/uriparser-0.9.1/ChangeLog

 > Signed-off-by: Carlos Santos <casantos@datacom.com.br>

Committed, thanks.

-- 
Bye, Peter Korsgaard
