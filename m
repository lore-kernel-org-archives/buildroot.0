From: Mark Jackson <mpfj@mimc.co.uk>
Date: Tue, 07 Oct 2008 09:33:35 +0100
Subject: [Buildroot] [BR-AVR32] [PATCH] Support for new MIMC200 board
In-Reply-To: <20081007074128.12613e2c@hcegtvedt>
References: <48EA05EB.7020807@mimc.co.uk> <20081007074128.12613e2c@hcegtvedt>
Message-ID: <48EB1EDF.6070209@mimc.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hans-Christian Egtvedt wrote:
> On Mon, 06 Oct 2008 13:34:51 +0100
> Mark Jackson <mpfj@mimc.co.uk> wrote:
> 
>> Please consider the following patch which adds support for a new
>> AVR32 based board.
>>
>> The board is closely based on Atmel's NGW100 reference board, but has
>> an extra 8MByte FLASH and 128KByte FRAM.
>>
>> The compressed patch is 66k, so I've stuck it on our website.
>>
>> http://www.mimc.co.uk/mimc200-new-board.patch.bz2
>>
> 
> Could you post it in plain text attachment/inline instead? It is a bit
> hard to comment on a compressed patch file ;)

Urm ... the patch is about 220k uncompressed.  I thought it was a "bad thing" to post such a large patch.

However, I'm happy to do so if you want !!

> Is the patch based on the latest uclibc.org repo or Buildroot for AVR32
> release (v2.2.0)?

The latest svn (actually r23594).

Mark
