From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Nov 2018 23:59:08 +0100
Subject: [Buildroot] [PATCH] liburiparser: security bump to version 0.9.0
In-Reply-To: <20181027221011.7703-1-casantos@datacom.com.br> (Carlos Santos's
 message of "Sat, 27 Oct 2018 19:10:11 -0300")
References: <20181027221011.7703-1-casantos@datacom.com.br>
Message-ID: <877ehgy477.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.com.br> writes:

 > Fixes an out-of-bounds write, detect an integer overflow and protect
 > against acting on NULL input. For additional datails, see

 >    https://github.com/uriparser/uriparser/blob/uriparser-0.9.0/ChangeLog

 > Signed-off-by: Carlos Santos <casantos@datacom.com.br>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
