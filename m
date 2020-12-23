From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Dec 2020 09:52:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/minizip: bump to version 2.10.5
In-Reply-To: <20201221135706.752966-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 21 Dec 2020 14:57:06 +0100")
References: <20201221135706.752966-1-fontaine.fabrice@gmail.com>
Message-ID: <878s9okip1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Drop patches (already in version)
 > - Set MZ_FETCH_LIBS to OFF (available since version 2.10.5 and
 >   https://github.com/nmoinvaz/minizip/commit/a1602ed9c82c6b2dd5ea8753dd3fecc3dcc74ba5)
 > - Use MZ_ICONV which is available since version 2.10.4 and
 >   https://github.com/nmoinvaz/minizip/commit/628830ff93c2fb1fd1bbb87ccea5857c5caf2af4
 > - Add xz optional dependency which is available since version 2.10.2 and
 >   https://github.com/nmoinvaz/minizip/commit/f1cc0e3898b23828765378b2ab6ba7622d1f8dbe

 > https://github.com/nmoinvaz/minizip/releases/tag/2.10.5
 > https://github.com/nmoinvaz/minizip/releases/tag/2.10.4
 > https://github.com/nmoinvaz/minizip/releases/tag/2.10.3
 > https://github.com/nmoinvaz/minizip/releases/tag/2.10.2
 > https://github.com/nmoinvaz/minizip/releases/tag/2.10.1

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
