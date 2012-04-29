From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 29 Apr 2012 20:31:54 +0200
Subject: [Buildroot] [PATCH 2/2] msmtp: new package
In-Reply-To: <9e08699205fdbcb212100ec3fb7597004c526456.1334677614.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 17 Apr 2012 17:46:57 +0200")
References: <cover.1334677614.git.thomas.petazzoni@free-electrons.com>
 <cover.1334677614.git.thomas.petazzoni@free-electrons.com>
 <9e08699205fdbcb212100ec3fb7597004c526456.1334677614.git.thomas.petazzoni@free-electrons.com>
Message-ID: <874ns25qzp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

 Thomas> +MSMTP_CONF_OPT += \
 Thomas> +	--without-libidn \
 Thomas> +	--without-libgsasl \
 Thomas> +	--without-gnome-keyring

Do notice we have libidn in buildroot, so it would be nice to see
optional support for it - But that can be done as a followup patch.

-- 
Bye, Peter Korsgaard
