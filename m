From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Tue, 5 Nov 2019 13:11:06 +0000
Subject: [Buildroot] [PATCH v3 1/4] package/bmap-tools: new package
In-Reply-To: <286368a9-6b48-54ba-dde5-b91448a476b1@smile.fr>
References: <20191027133630.7706-1-nicolas.carrier@orolia.com>
 <286368a9-6b48-54ba-dde5-b91448a476b1@smile.fr>
Message-ID: <6e5737194c4f68ef04fdcc341ab89e1b6438a3e6.camel@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2019-11-04 at 22:51 +0100, Romain Naour wrote:
> Hi Nicolas,
> 

Hello,

> > +       that large file containing unused blocks, like raw system
> > +       image files, can be copied or flashed a lot faster with
> > +       bmaptool than with traditional tools like "dd" or "cp".
> 
> We usually add a link to the upstream project in the last line of the
> help text:
> https://github.com/intel/bmap-tools
> 

Thank you, I fixed it in v4.

> Reviewed-by: Romain Naour <romain.naour@smile.fr>
> 
> Best regards,
> Romain
> 
