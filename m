From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 18:58:53 +0100
Subject: [Buildroot] [PATCH 3/3] package/exiv2: fix CVE-2019-20421
In-Reply-To: <20200229213204.3703303-3-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 29 Feb 2020 22:32:04 +0100")
References: <20200229213204.3703303-1-fontaine.fabrice@gmail.com>
 <20200229213204.3703303-3-fontaine.fabrice@gmail.com>
Message-ID: <87mu8istr6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > In Jp2Image::readMetadata() in jp2image.cpp in Exiv2 0.27.2, an input
 > file can result in an infinite loop and hang, with high CPU consumption.
 > Remote attackers could leverage this vulnerability to cause a denial of
 > service via a crafted file.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
