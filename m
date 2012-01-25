From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 25 Jan 2012 22:21:21 +0100
Subject: [Buildroot] Kconfig
In-Reply-To: <1327518856.21058.53.camel@hp-dhlii>
References: <1327518856.21058.53.camel@hp-dhlii>
Message-ID: <201201252221.21220.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

David, All,

On Wednesday 25 January 2012 20:14:16 David Lynch Jr. wrote:
> This is probably not the right list for this, but I have a project that 
> makes sense to use the configuration system that BareBox, BuildRoot,
> the 
> Linux Kernel and some other things are using.
> 
> Where can I find some documentation, information to try to get this 
> setup for a new project.

As it happens, I have just started working on this myself. I created a
package with just the kconfig parser and frontends, and just added the
required autotools-glue around these. This is not yet complete, but it
Works For Me (TM).

The Mercurial repository is available there:
   http://ymorin.is-a-geek.org/hg/kconfig-frontends/

Don't expect this to be its permanent home. Also, don't expect that the
repository content is stable. This is just preliminary work. I have no
plan yet as to how I will handle releases, and how the version numbering
will be handled, and stuff like that...

Note also that it's just about the parser and frontends, and does not
contain the build-system itself.

I will announce it shortly on the linux-kbuild mailing list...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
