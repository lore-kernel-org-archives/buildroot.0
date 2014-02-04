From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Feb 2014 10:13:49 +0100
Subject: [Buildroot] [pkg-perl infra V3 03/12] scancpan: a new script
In-Reply-To: <1385198749-6249-4-git-send-email-francois.perrad@gadz.org>
References: <1385198749-6249-1-git-send-email-francois.perrad@gadz.org>
 <1385198749-6249-4-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140204091349.GD3454@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2013-11-23 10:25 +0100, Francois Perrad spake thusly:
> which populates the directory package/cpan

I think this would deserve a bit more explanations, here and in the
cover letter.

For example, it is not obvious what this script does, and what it is
for, and what the expected result is.

Note that I am reviewing the patches in sequence, so this may become
obvious in the following patches, but still, I think we do want the
explanations explicitly with this patch, so we do not need to infer it
from the following changes...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
