From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 9 Dec 2009 21:11:46 +0000 (UTC)
Subject: [Buildroot] Documentation question
References: <hfp1uh$6fk$1@ger.gmane.org>
Message-ID: <hfp3qi$e30$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2009-12-09, Grant Edwards <grant.b.edwards@gmail.com> wrote:

> I've been reading the "buildroot usage and documentation"
> document over the past couple days, and in order to not be a
> complete leech, I'm fixing various minor problems (typos,
> spelling, punctuation, usage, grammar, etc.) and will submmit a
> patch when I've finished.
>
> However, I've run across one paragraph where I think the actual
> content could use a tweak, and I thought I should ask about it
> before making a change.

Another question on content -- the doc says

  Buildroot optionally honors some environment variables that
  are passed to make:
  
    HOSTCXX, the host C++ compiler to use
    HOSTCC, the host C compiler to use
    UCLIBC_CONFIG_FILE [...]

From what I've been able to figure out, honoring those is not
an option.  Aren't they're always honored?  If honoring those
is optional, how/where is that option configured?

-- 
Grant Edwards                   grante             Yow! An Italian is COMBING
                                  at               his hair in suburban DES
                               visi.com            MOINES!
