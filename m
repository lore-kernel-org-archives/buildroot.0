From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 06 Feb 2017 22:52:25 +0100
Subject: [Buildroot] [PATCH 1/1] sudo: Add ldap support for sudoers rules
In-Reply-To: <20170206223806.5632b9ad@free-electrons.com> (Thomas Petazzoni's
 message of "Mon, 6 Feb 2017 22:38:06 +0100")
References: <1477323263-6689-1-git-send-email-cdf123@cdf123.net>
 <20170206195401.11ccbee3@free-electrons.com>
 <87r33buhqk.fsf@dell.be.48ers.dk>
 <20170206223806.5632b9ad@free-electrons.com>
Message-ID: <87mvdzugva.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Mon, 06 Feb 2017 22:33:39 +0100, Peter Korsgaard wrote:

 >> > I've applied, after removing the explicit Config.in option and instead
 >> > relying on whether BR2_PACKAGE_OPENLDAP is enabled or not to decide if
 >> > ldap support should be enabled or not in sudo.  
 >> 
 >> Notice that this was discussed during the first review:
 >> 
 >> http://lists.busybox.net/pipermail/buildroot/2016-October/175480.html
 >> 
 >> Apparently sudo with pam support really needs a configured
 >> /etc/ldap.conf, which might be confusing to people that (perhaps
 >> unrelated to eachother) enabled both sudo and ldap.

 > So in other words we really want to have a sub-option for this
 > situation?

I don't personally know anything about it, but that was the conclusion
of Arnout and Chris, yes.

-- 
Bye, Peter Korsgaard
