From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Sep 2012 21:02:56 +0200
Subject: [Buildroot] [PATCH 06/13] cpanminus: new package v3
In-Reply-To: <CAB0FRsv6CbPpvsYaA0cdJLA_qu+8zBg1TTkdSUDiWhVi1poW3Q@mail.gmail.com>
References: <1347107325-4163-1-git-send-email-francois.perrad@gadz.org>
 <1347107325-4163-6-git-send-email-francois.perrad@gadz.org>
 <20120920220418.65bb6b14@skate> <505B8C14.5090103@mind.be>
 <CAB0FRsv6CbPpvsYaA0cdJLA_qu+8zBg1TTkdSUDiWhVi1poW3Q@mail.gmail.com>
Message-ID: <20120921210256.4214a751@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fran?ois Perrad,

On Fri, 21 Sep 2012 20:25:14 +0200, Fran?ois Perrad wrote:

> Perl is useless without a CPAN client.
> The Perl packages are fine grained (compared to Python or Ruby ones),
> for example the web framework Dancer (without any plugins) requires 22
> dependencies (direct or indirect).
> Debian has more then thousand Perl packages; I don't want to do the same thing.
> 
> Most of CPAN packages haven't a license file; usually the
> documentation contains an information, like : "LICENSE - same as Perl
> itself".
> 
> The reproductibility of a project (with an identified version of each
> CPAN module) could be done with a local CPAN mirror.

Ok. I am not a big fan, but I don't care too much about Perl for
embedded systems, and you are the one interested in Perl support, so
let's bring in what you believe is the right solution.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
