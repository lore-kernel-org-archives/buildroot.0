From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Mar 2021 13:44:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/libebml: security bump to
 version 1.4.2
In-Reply-To: <20210303101039.500302-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 3 Mar 2021 11:10:39 +0100")
References: <20210303101039.500302-1-fontaine.fabrice@gmail.com>
Message-ID: <87eegwjtjo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2021-3405: A flaw was found in libebml before 1.4.2. A heap
 > overflow bug exists in the implementation of EbmlString::ReadData and
 > EbmlUnicodeString::ReadData in libebml.

 > https://github.com/Matroska-Org/libebml/blob/release-1.4.2/ChangeLog

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
