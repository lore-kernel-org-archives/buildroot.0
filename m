From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Dec 2019 17:49:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-ecdsa: bump to version
 0.13.3
In-Reply-To: <20191012084739.19673-1-asafka7@gmail.com> (Asaf Kahlon's message
 of "Sat, 12 Oct 2019 11:47:37 +0300")
References: <20191012084739.19673-1-asafka7@gmail.com>
Message-ID: <874kxy3nis.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Asaf" == Asaf Kahlon <asafka7@gmail.com> writes:

 > Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

Committed to 2019.02.x after adjusting the commit message to make it
clear that this is a security fix, thanks.

In the future, please mention when version bumps contain security fixes,
thanks. In this case the release notes were literally:

Fix CVE-2019-14853 - possible DoS caused by malformed signature decoding
Fix CVE-2019-14859 - signature malleability caused by insufficient checks of DER encoding

Also harden key decoding from string and DER encodings.

https://github.com/warner/python-ecdsa/releases/tag/python-ecdsa-0.13.3

-- 
Bye, Peter Korsgaard
