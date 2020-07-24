From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Jul 2020 13:40:53 +0200
Subject: [Buildroot] [PATCH v2] package/cdrkit: fix build with GCC 10
In-Reply-To: <20200719174236.534982-1-urjaman@gmail.com> (Urja Rannikko's
 message of "Sun, 19 Jul 2020 20:42:36 +0300")
References: <20200625005836.2232591-1-urjaman@gmail.com>
 <20200719174236.534982-1-urjaman@gmail.com>
Message-ID: <87wo2tdttm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Urja" == Urja Rannikko <urjaman@gmail.com> writes:

 > This patch adds a missing extern on the outfile
 > variable in genisoimage.h.

 > Signed-off-by: Urja Rannikko <urjaman@gmail.com>
 > ---
 > Note: I would like to see this applied to the LTS 2020.02
 > branch too, since it fixes building host-cdrkit for ISO9660
 > generation with a host GCC 10.

 > v2: Make the patch a fully fledged commit with a sign-off and
 > way more description than is necessary for a single "extern".

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
