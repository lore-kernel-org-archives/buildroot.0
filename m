From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 17:26:55 +0100
Subject: [Buildroot] [PATCH] package/openssh: add upstream security fix
In-Reply-To: <032192ec20e9352fd72418814e51cda13114ef8f.1547551073.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 15 Jan 2019 13:17:53 +0200")
References: <032192ec20e9352fd72418814e51cda13114ef8f.1547551073.git.baruch@tkos.co.il>
Message-ID: <87y37ac980.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes CVE-2018-20685: The scp client allows server to modify permissions
 > of the target directory by using empty ("D0777 0 \n") or dot ("D0777 0
 > .\n") directory name.

 > The bug reporter lists a number of related vulnerabilities that are not
 > fixed yet:

 >   https://sintonen.fi/advisories/scp-client-multiple-vulnerabilities.txt

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
