From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 17:27:25 +0100
Subject: [Buildroot] [PATCH 1/1] php: security bump to 7.3.1
In-Reply-To: <20190119212934.85216-1-aduskett@gmail.com> (aduskett@gmail.com's
 message of "Sat, 19 Jan 2019 16:29:34 -0500")
References: <20190119212934.85216-1-aduskett@gmail.com>
Message-ID: <878sz377ki.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:

 > From: Adam Duskett <Aduskett@gmail.com>
 > Fixes the following security issue:

 > - CVE-2018-19935: Allows remote attackers to cause a denial of service
 >   (NULL pointer dereference and application crash) via an empty string in the
 >   message argument to the imap_mail function.
 > https://www.cvedetails.com/cve/CVE-2018-19935/

 > Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Given the fallout from moving to 7.3.x, I have NOT applied this to
2018.02.x / 2018.11.x. Instead I have applied a patch to bump the
version to 7.2.14, which fixes the same CVE.

-- 
Bye, Peter Korsgaard
