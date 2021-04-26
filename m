From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 16:05:20 +0200
Subject: [Buildroot] [PATCH 2/2] package/python-mbstrdecoder: bump to
 version 1.0.1
In-Reply-To: <20210410122618.79085-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 10 Apr 2021 14:26:18 +0200")
References: <20210410122618.79085-1-fontaine.fabrice@gmail.com>
 <20210410122618.79085-2-fontaine.fabrice@gmail.com>
Message-ID: <87r1ixjg4f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > https://github.com/thombashi/mbstrdecoder/releases/tag/v1.0.1
 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

This seems to only include a bugfix for chardet >= 4 (which is the
version we use), so committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
