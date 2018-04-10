From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Apr 2018 22:44:33 +0200
Subject: [Buildroot] [PATCH] libxml2: add security fix
In-Reply-To: <1f304b7afb41b9d40ca50de930b2cbd2cda740cf.1518167278.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 9 Feb 2018 11:07:58 +0200")
References: <1f304b7afb41b9d40ca50de930b2cbd2cda740cf.1518167278.git.baruch@tkos.co.il>
Message-ID: <8737027pvy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > CVE-2017-8872: An attackers can cause a denial of service (buffer
 > over-read) or information disclosure.

 > Patch from the upstream bug tracker.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
