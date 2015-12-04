From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 4 Dec 2015 11:04:27 -0300
Subject: [Buildroot] Howto use "Makeusers"
In-Reply-To: <56619CCF.6040008@gmx.de>
References: <56619CCF.6040008@gmx.de>
Message-ID: <56619D6B.7080905@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/12/15 11:01, Andreas Ehmanns wrote:

> Hello,
> to make an openldap server available for buildroot I created an init
> script which starts the ldap server as non-privileged user (and group).
> Since the ldap user and group is not existing on the target I searched
> for a way to let the openldap package add the user and group to the
> target filesystem. The buildroot documentation describes in chapter 23
> the syntax of "makeusers". So far so good, but I have no idea to which
> file I should add the corresponding makeusers command.
>
> I grepped the buildroot tree for an example but unfortunately did not
> found a package using this command.
>
> Does anybody have an example how to do this.
>
> Regards,
> Andreas

Hi.
Actually several packages use this functionality, see for example 
package/squid/squid.mk (SQUID_USERS), package/redis/redis.mk 
(REDIS_USERS) and such.
Regards.
