From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 9 Mar 2011 18:20:11 +0000 (UTC)
Subject: [Buildroot] Is PHP download link in php.mk broken?
References: <il8fpe$k15$1@dough.gmane.org> <il8g6t$nke$1@dough.gmane.org>
Message-ID: <il8gcq$pqn$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2011-03-09, Grant Edwards <grant.b.edwards@gmail.com> wrote:
> On 2011-03-09, Grant Edwards <grant.b.edwards@gmail.com> wrote:
>
>> I enabled the php package today, and it appears that the download
>> link used by buildroot is invalid.  It's using
>>
>> /home/nextgen/buildroot/downloads/php-$(PHP_VERSION).tar.bz2
>
> Pasted the wrong thing.  That's
>
> http://www.php.net/distributions/php-$(PHP_VERSION).tar.bz2
>
> And apparently the PHP site only allows downloading of the current
> version.   Since my buildroot snaphost isn't using the current version
> of PHP, I can't build it. :/

I found older releases at:

http://museum.php.net/php5/php-$(PHP_VERSION).tar.bz2

But, that link _won't_ work for the current version.  Is there a way
to provide multiple download links in a .mk file?

-- 
Grant Edwards               grant.b.edwards        Yow! ... I don't like FRANK
                                  at               SINATRA or his CHILDREN.
                              gmail.com            
