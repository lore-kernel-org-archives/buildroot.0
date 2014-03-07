From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 7 Mar 2014 18:37:29 +0100
Subject: [Buildroot] question about buildroot manual license
In-Reply-To: <20140307063131.GL4148@waldemar-brodkorb.de>
References: <20140307063131.GL4148@waldemar-brodkorb.de>
Message-ID: <20140307173729.GD3384@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Waldemar, All,

On 2014-03-07 07:31 +0100, Waldemar Brodkorb spake thusly:
> Hi developers, 
> I am reading the buildroot manual and it is nice to read.
> I would like to add some documentation to my own buildroot derivate,                                                                                                                                      
> so my question is, what license is used for your document?
> I have not found any mentioning about a license of the docs,
> I am not sure if GPLv2 (the license of buildroot) is applicable
> for documentation.        

What makes you think GPLv2 is not applicable to the Buildroot's manual?

The license for Buildroot is GPLv2. Which means that everything provided
with Buildroot, unless otherwise specified in the files themselves or in
an accompanying license file, is covered by Buildroot's license. [*]

Maybe the GPLv2 is not the best license for documentation, but as long
as there is no other licensing terms for the manual, that's the license
that applies to Buildroot's manual.

[*] Note: the patches we cary against the different packages are of
course covered by the license of the package they each apply to, which
may or may not be the same license as Buildroot's. Refer to each package
licensing terms for the license of the patches.

> Is it enough for you, if I add something like this in the top
> of the document:
> "based on the buildroot manual. See http://www.buildroot.net for 
> original authors."

No, that's not enough. You have to respect the full terms of the GPLv2.
Which basicaly translates to providing, but is not limited to providing,
the following items:

  - the source materials (the asciidoc files in docs/manual are considered
    the sources for the manual),

  - the scripts used to generate the manual from the asciidoc sources (the
    docs/manual/manual.mk),

  - the copyright notices where they appear, intact, with your own
    copyright added if you did some substantial changes

Note: IANAL; this is not legal advice; consult a lawyer.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
