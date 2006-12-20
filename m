From: Bernhard Fischer <rep.nop@aon.at>
Date: Wed, 20 Dec 2006 18:16:39 +0100
Subject: [Buildroot] Adding nasm to toolchain
In-Reply-To: <5e15b0e10612200157l48183bd9tb77fc3c56f8981e9@mail.gmail.com>
References: <5e15b0e10612200157l48183bd9tb77fc3c56f8981e9@mail.gmail.com>
Message-ID: <20061220171639.GA24825@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 20, 2006 at 10:57:53AM +0100, Rory Slegtenhorst wrote:
>Hi,
>
>I'm working on integrating our software package into buildroot.
>Shouldn't be all that hard, but just one tiny matter.
>A small portion of our code needs nasm to compile.
>
>How can I incorporate nasm into the toolchain without needing it on the target?
>I only need it in compile time...

look at the -host targets, e.g. mtd

HTH,
