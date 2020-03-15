From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 10:22:52 +0100
Subject: [Buildroot] [PATCH 2/2] package/taglib: fix CVE-2018-11439
In-Reply-To: <20200301203759.218341-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 1 Mar 2020 21:37:59 +0100")
References: <20200301203759.218341-1-fontaine.fabrice@gmail.com>
 <20200301203759.218341-2-fontaine.fabrice@gmail.com>
Message-ID: <874kuqotub.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > The TagLib::Ogg::FLAC::File::scan function in oggflacfile.cpp in TagLib
 > 1.11.1 allows remote attackers to cause information disclosure
 > (heap-based buffer over-read) via a crafted audio file.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
