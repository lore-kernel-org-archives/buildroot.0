From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 18:58:49 +0100
Subject: [Buildroot] [PATCH 2/3] package/exiv2: fix CVE-2019-17402
In-Reply-To: <20200229213204.3703303-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 29 Feb 2020 22:32:03 +0100")
References: <20200229213204.3703303-1-fontaine.fabrice@gmail.com>
 <20200229213204.3703303-2-fontaine.fabrice@gmail.com>
Message-ID: <87r1xustra.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Exiv2 0.27.2 allows attackers to trigger a crash in Exiv2::getULong in
 > types.cpp when called from Exiv2::Internal::CiffDirectory::readDirectory
 > in crwimage_int.cpp, because there is no validation of the relationship
 > of the total size to the offset and size.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
