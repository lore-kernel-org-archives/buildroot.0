From: Simon Dawson <spdawson@gmail.com>
Date: Tue, 21 Aug 2012 12:38:29 +0100
Subject: [Buildroot] [PATCH 2/4] zeromq: add license information
In-Reply-To: <20120821124200.59ffab03@skate>
References: <1345406924-6574-1-git-send-email-spdawson@gmail.com>
 <1345406924-6574-2-git-send-email-spdawson@gmail.com>
 <20120821124200.59ffab03@skate>
Message-ID: <CAHt8ZCN0P9_xEWzKhWcKLy=WixYoE8ZtVS0WYkmxT_Cu8ufrow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21 August 2012 11:42, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Sun, 19 Aug 2012 21:08:42 +0100,
> spdawson at gmail.com a ?crit :
>
>> +ZEROMQ_LICENSE = GPLv3+
>> +ZEROMQ_LICENSE_FILES = COPYING
>
> No. Most of ZeroMQ is apparently under the LGPLv3+, but the
> COPYING.LESSER contains a special exception. This needs to be encoded
> differently.

Okay; thanks Thomas. It's not clear to me how properly to express that
using the package license variables; I'll wait to see if there are any
suggestions.

Simon.
