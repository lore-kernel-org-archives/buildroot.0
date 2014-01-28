From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jan 2014 23:09:04 +0100
Subject: [Buildroot] full rebuild and errors
In-Reply-To: <52E8120F.7080805@gmail.com>
References: <52E4FA8C.7060109@gmail.com> <52E6945C.40202@mind.be>
 <52E8120F.7080805@gmail.com>
Message-ID: <20140128230904.1f01a5dc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marco Trapanese,

On Tue, 28 Jan 2014 21:24:47 +0100, Marco Trapanese wrote:

> Yeah! It did the trick!
> I can't imagine it was a ccache problem because I deleted the whole 
> directory and cloned again the repository from scratch - I thought it 
> should reset anything to the initial state, my fault!

No, it doesn't. The cache of ccache is located in
~/.buildroot-ccache/, because the intent of ccache is precisely to be
able to re-use the cache contents across complete rebuilds, and even
across multiple clones of Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
