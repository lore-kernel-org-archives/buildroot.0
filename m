From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jan 2015 18:46:47 +0100
Subject: [Buildroot] [PATCH 1/1] gtest: install libgtest_main to staging
In-Reply-To: <1421780073-16345-1-git-send-email-erico.nunes@datacom.ind.br>
References: <1421780073-16345-1-git-send-email-erico.nunes@datacom.ind.br>
Message-ID: <20150125184647.0fd291bc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear erico.nunes,

On Tue, 20 Jan 2015 16:54:33 -0200, erico.nunes wrote:
> gtest provides a separate libgtest_main library with a default main()
> implementation for tests with basic needs.
> This separate library isn't being installed by buildroot. This patch
> adds the installation of this library to staging during the install of
> gtest.
> 
> Signed-off-by: erico.nunes <erico.nunes@datacom.ind.br>

Thanks, applied. I only adjusted the Signed-off-by line and Author
information to be a little bit nicer than "erico.nunes".

Can you fixup your Git configuration to have your name as "FirstName
LastName" instead of "firstname.lastname".

I.e, your ~/.gitconfig should look like:

[user]
	name = Erico Nunes
	email = erico.nunes at datacom.ind.br

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
