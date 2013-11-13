From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Wed, 13 Nov 2013 12:41:09 +0000
Subject: [Buildroot] [PATCH v2] infra: introduce github helper function
In-Reply-To: <CAGduivx93_GbmnupCXxwnPXF_o-vGVnL+45WXUnXXdO+rf-Kng@mail.gmail.com>
References: <1384345469-8967-1-git-send-email-mjonker@synopsys.com>
 <CAGduivx93_GbmnupCXxwnPXF_o-vGVnL+45WXUnXXdO+rf-Kng@mail.gmail.com>
Message-ID: <E6BF041E97966E4DB955F0DF883AD2D685F176B4@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime,

> How about a dedicated URI scheme like
> github://<username>/<package>/<version> instead of a call to a macro ?
> I find it easier to remember, less error prone and maybe more user friendly.

Personally I don't have a strong preference; I chose the helper function because of the earlier discussion:

http://lists.busybox.net/pipermail/buildroot/2013-November/081714.html

Mischa
