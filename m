From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Oct 2018 13:58:00 +0200
Subject: [Buildroot] [PATCH v2 1/1] libxslt: point to the correct
 xml2-config location
In-Reply-To: <20180921145836.30424-1-ferdinand@ombud.nl> (Ferdinand van
 Aartsen's message of "Fri, 21 Sep 2018 16:58:36 +0200")
References: <20180921145836.30424-1-ferdinand@ombud.nl>
Message-ID: <875zyg61x3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ferdinand" == Ferdinand van Aartsen <ferdinand@ombud.nl> writes:

 > Currently libxslt configure finds native /usr/bin/xml2-config.
 > Signed-off-by: Ferdinand van Aartsen <ferdinand@ombud.nl>
 > ---
 > Changes v1 -> v2:
 >   - Title format change (requested by Thomas).
 >   - Drop the unneeded host changes.

Committed to 2018.02.x, 2018.05.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
