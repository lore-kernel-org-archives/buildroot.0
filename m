From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 29 Jan 2017 16:08:51 +0100
Subject: [Buildroot] [PATCH 1/1] sudo: Add ldap support for sudoers rules
In-Reply-To: <20170129141804.4749c24d@free-electrons.com>
References: <1477323263-6689-1-git-send-email-cdf123@cdf123.net>
 <e3b18d4b-5eba-ea4f-f8da-0c07e3eff8ae@gmail.com>
 <20170129141804.4749c24d@free-electrons.com>
Message-ID: <01d6cccc-8865-01d7-ca46-a08c452a73b6@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Chris, All,

Le 29/01/2017 ? 14:18, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Sat, 28 Jan 2017 15:55:22 +0100, Romain Naour wrote:
> 
>> Maybe add a comment here
>>
>> comment "ldap integration needs openldap"
>> 	depends on !BR2_PACKAGE_OPENLDAP
> 
> Well, I'm not against Config.in comments, but in that case, isn't it
> sufficiently obvious to the user? Surely if you think about using LDAP
> support in sudo, you know that you need to have some kind of LDAP
> implementation.
> 
> Which makes me think that perhaps a new sub-option is maybe not needed.
> Why not just enable LDAP support in sudo when BR2_PACKAGE_OPENLDAP=y ?

Yes, It seems a better idea :)

Best regards,
Romain

> 
> Thomas
> 
