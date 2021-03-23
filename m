From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Mar 2021 23:13:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/zstd: security bump to version
 1.4.9
In-Reply-To: <20210320090525.440922-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 20 Mar 2021 10:05:25 +0100")
References: <20210320090525.440922-1-fontaine.fabrice@gmail.com>
Message-ID: <871rc5o6vw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2021-24032: Beginning in v1.4.1 and prior to v1.4.9, due to an
 > incomplete fix for CVE-2021-24031, the Zstandard command-line utility
 > created output files with default permissions and restricted those
 > permissions immediately afterwards. Output files could therefore
 > momentarily be readable or writable to unintended parties.

 > https://github.com/facebook/zstd/releases/tag/v1.4.9

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
