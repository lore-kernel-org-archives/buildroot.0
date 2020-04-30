From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Apr 2020 14:16:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/wget: add optional dependency
 to libiconv
In-Reply-To: <20200316191527.551576-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Mon, 16 Mar 2020 20:15:27 +0100")
References: <20200316191527.551576-1-bernd.kuhls@t-online.de>
Message-ID: <877dxx6uew.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > wget has an optional dependency to libiconv:
 > http://git.savannah.gnu.org/cgit/wget.git/tree/configure.ac#n344

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
