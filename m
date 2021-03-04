From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 04 Mar 2021 21:20:24 +0100
Subject: [Buildroot] [PATCH 2/2] package/gnuchess: security bump to
 version 6.2.7
In-Reply-To: <20210304130846.1734524-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 4 Mar 2021 14:08:46 +0100")
References: <20210304130846.1734524-1-fontaine.fabrice@gmail.com>
 <20210304130846.1734524-2-fontaine.fabrice@gmail.com>
Message-ID: <878s72hdrr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2019-15767: In GNU Chess 6.2.5, there is a stack-based buffer
 > overflow in the cmd_load function in frontend/cmd.cc via a crafted chess
 > position in an EPD file.

 > Update indentation in hash file (two spaces)

 > https://lists.gnu.org/archive/html/info-gnu-chess/2020-04/msg00000.html
 > https://lists.gnu.org/archive/html/info-gnu-chess/2020-05/msg00000.html

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
