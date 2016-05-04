From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 4 May 2016 20:58:18 +0200
Subject: [Buildroot] understand what I have to rebuild
In-Reply-To: <57298CBD.5040301@gmail.com>
References: <57298CBD.5040301@gmail.com>
Message-ID: <95b9b78c-d66c-1292-449a-45e1b679fa9c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/04/16 07:46, Marco Trapanese wrote:
> Hi!
> Simple question.
> I'm a working buildroot environment, and I need to add the SQLite support for Qt5.
>
> It's enough to: make qt5base-dirclean && make?

  You may also need to rebuild packages that use qt5, it's hard to be sure. The 
only safe thing to do is a 'make clean; make'. But if you want to take the risk 
you can try with just rebuilding qt5base.


  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
