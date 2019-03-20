From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Mar 2019 14:46:35 +0100
Subject: [Buildroot] [PATCH 0/3] Gummiboot fixup
In-Reply-To: <CAOR3GqXSxZw3m+OD3FLCFOR0Gi-v3zNJGe2+3Bhy7R6av7LVhQ@mail.gmail.com>
 (Esben Haabendal's message of "Wed, 20 Mar 2019 13:59:49 +0100")
References: <20190319112852.9592-1-esben.haabendal@gmail.com>
 <875zseitgs.fsf@dell.be.48ers.dk>
 <CAOR3GqXSxZw3m+OD3FLCFOR0Gi-v3zNJGe2+3Bhy7R6av7LVhQ@mail.gmail.com>
Message-ID: <875zsdek04.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Esben" == Esben Haabendal <esbenhaabendal@gmail.com> writes:

 > On Tue, Mar 19, 2019 at 7:56 PM Peter Korsgaard <peter@korsgaard.com> wrote:
 >> Out of interest, what is the use case for using gummiboot? We recently
 >> added systemd-boot support, so I was considering removing gummiboot as
 >> it is dead upstream.
 >> 
 >> Notice that you currently cannot enable systemd-boot without the rest of
 >> systemd, so that may be a disadvantage.
 >> 

 > In this case, I am upgrading a system which is currently using gummiboot.
 > Switching to systemd-boot does not seem to bring anything meaningful
 > improvements,
 > as gummiboot does the job of booting the system.

Ok. Out of interest, what is gummiboot adding over just directly booting
a Linux kernel with CONFIG_EFI_STUB?

 > And yes, this is not a systemd system, and transforming the entire
 > system to systemd is clearly a big thing compared to just fixing
 > building of gummiboot.

 > I would prefer if we could keep gummiboot support in buildroot for now.

Fine by me. Will you add yourself to DEVELOPERS for gummiboot?

-- 
Bye, Peter Korsgaard
