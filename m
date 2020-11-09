From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 Nov 2020 17:08:30 +0100
Subject: [Buildroot] [PATCH for-master] package/elf2flt: add support for
 binutils >= 2.34
In-Reply-To: <20201107225535.1781080-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sat, 7 Nov 2020 23:55:35 +0100")
References: <20201107225535.1781080-1-romain.naour@gmail.com>
Message-ID: <87zh3qsebl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Various bfd section macros and functions like bfd_section_size() have been
 > modified starting with binutils >= 2.34.
 > Add a patch to handle this API change.

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
