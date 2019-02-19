From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Feb 2019 08:31:49 +0100
Subject: [Buildroot] [PATCH v3] package/openssh: Add sysusers.d snippet
In-Reply-To: <20190206163629.30683-1-chris.lesiak@licor.com> (Chris Lesiak's
 message of "Wed, 6 Feb 2019 16:36:39 +0000")
References: <20190206163629.30683-1-chris.lesiak@licor.com>
Message-ID: <8736okb5ei.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Chris" == Chris Lesiak <chris.lesiak@licor.com> writes:

 > Whether using the new sysusers.d snippet, or adding an entry to
 > /etc/password, set the service's home directory to /var/empty.
 > See README.privsep included as part of the openssh distribution.

 > Signed-off-by: Chris Lesiak <chris.lesiak@licor.com>
 > ---
 > Changes v2 -> v3:
 >   - Define OPENSSH_USERS or install snippet, but not both
 >   - Configure home directory to /var/empty
 >   - Rename snippet sshd-sysusers.conf

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
