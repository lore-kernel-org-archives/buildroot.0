From: Andreas Ehmanns <universeii@gmx.de>
Date: Fri, 4 Dec 2015 09:21:12 +0100
Subject: [Buildroot] Move openldap package and enable LDAP server?
In-Reply-To: <20151204091924.2f5f9c22@free-electrons.com>
References: <56614B18.4030703@gmx.de>
 <20151204091924.2f5f9c22@free-electrons.com>
Message-ID: <56614CF8.5050804@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 04.12.2015 um 09:19 schrieb Thomas Petazzoni:
> Hello,
>
> On Fri, 4 Dec 2015 09:13:12 +0100, Andreas Ehmanns wrote:
>
>> I was going to use openLDAP on my embedded device and found the
>> configuration under Target Packages -> Libraries -> Networking.
>> You can enable openldap which only generates the ldap libraries but have
>> an option to let the client applications being built.
>> Since I need the LDAP server I added an option to compile the LDAP
>> server too. Everything works fine and I thought about submitting the
>> patch but then I asked me if the configuration location is still the
>> right place.
>> Wouldn't it be better to place the openldap configuration under
>> Target Packages -> Networking Applications
>> instead of
>> Target Packages -> Libraries -> Networking
>>
>> What is your opinion?
> Yes, I agree that it probably makes more sense to have OpenLDAP in
> Networking Applications, even if it indeed also provides a client
> library.
>
> Thomas
O.k., I will prepare/propose a patch for adding the ldap server option 
and moving the configuration to Networking Applications.

Regards,
Andreas
