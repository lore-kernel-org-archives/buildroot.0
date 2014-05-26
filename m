From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 May 2014 15:48:48 +0200
Subject: [Buildroot] Fwd: all files and folders seem as an executable
 file ?
In-Reply-To: <CAMm5Yqpk5=2-EBa51qmiWrOA2qHE+_2Bh5Y2s=_064zN2u_AeA@mail.gmail.com>
References: <CAMm5YqrU4Vk9KJpVVPoYrNL-wNeVXEPVu3GdSLTNe2gYHc=ZMw@mail.gmail.com>
 <20140526135034.74637680@free-electrons.com>
 <CAMm5YqqX4pKA5Exxser2OSWfsUX9sHp2Tjsump2cW65JHktHeA@mail.gmail.com>
 <CAMm5Yqrn7psH2jRb2Uh1u30ni4iQdNMDSUy1=U3vHz5tu+sRTA@mail.gmail.com>
 <20140526152359.3918fd4a@free-electrons.com>
 <CAMm5Yqpk5=2-EBa51qmiWrOA2qHE+_2Bh5Y2s=_064zN2u_AeA@mail.gmail.com>
Message-ID: <20140526154848.3f948951@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear cem akpolat,

On Mon, 26 May 2014 15:37:04 +0200, cem akpolat wrote:

> The following shows the folders' permissions, as you see the folders are
> seen as executable.

Yes, and? Executable directories are normal. Read
http://en.wikipedia.org/wiki/File_system_permissions, about the
executable permission: "When set for a directory, this permission
grants the ability to access file contents and metainfo if its name is
known, but not list files inside the directory (unless read is set)."

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
