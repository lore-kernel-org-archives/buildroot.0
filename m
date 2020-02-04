From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Feb 2020 17:30:12 +0100
Subject: [Buildroot] [PATCH] package/php-*: remove php dependency for
 php modules
In-Reply-To: <20200204132443.1186904-1-romain.naour@smile.fr> (Romain Naour's
 message of "Tue, 4 Feb 2020 14:24:43 +0100")
References: <20200204132443.1186904-1-romain.naour@smile.fr>
Message-ID: <874kw6jox7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > php modules can't be selected if the php package is not selected, see [1].
 > So adding the dependency is not necessary.
 > Also we don't add such dependencies for python modules.

 > [1] https://git.buildroot.net/buildroot/tree/package/Config.in?h=2019.11#n798

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > Cc: Nicolas Carrier <nicolas.carrier@orolia.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
