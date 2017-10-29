From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 29 Oct 2017 13:43:43 +0100
Subject: [Buildroot] "Buildroot: what's new" slides
In-Reply-To: <20171027145402.2404fa4b@windsurf.lan>
References: <20171027145402.2404fa4b@windsurf.lan>
Message-ID: <20171029124343.GA18785@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all!
On 17-10-27 14:54:02, Thomas Petazzoni wrote:

>  - Is there some support for the Rust language. I mentioned the patches
>    from Eric Le Bihan, and said help was definitely welcome.

Regarding to this patch series, I did not sent a new version featuring
latest Rust version (1.21.0), as there were some points to be cleared
[1]:

- should the standard library be available as a separate package?
- how can the package providing the compiler as binary be used to
  bootstrap the compiler built from source (in terms of Buildroot
  package declaration)?
- method for crate (Rust package) retrieval (i.e. package management).

Comments and suggestions welcome.

[1] https://patchwork.ozlabs.org/comment/1764873/

Regards,

--
ELB
