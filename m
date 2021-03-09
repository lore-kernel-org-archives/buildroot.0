From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Mar 2021 00:00:39 +0100
Subject: [Buildroot] [PATCH] package/openldap: add upstream security fix
 for CVE-2021-27212
In-Reply-To: <20210226231318.21482-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 27 Feb 2021 00:13:17 +0100")
References: <20210226231318.21482-1-peter@korsgaard.com>
Message-ID: <87sg5453vs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > In OpenLDAP through 2.4.57 and 2.5.x through 2.5.1alpha, an assertion
 > failure in slapd can occur in the issuerAndThisUpdateCheck function via a
 > crafted packet, resulting in a denial of service (daemon exit) via a short
 > timestamp.  This is related to schema_init.c and checkTime.

 > For more details, see the bugtracker:
 > https://bugs.openldap.org/show_bug.cgi?id=9454

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
