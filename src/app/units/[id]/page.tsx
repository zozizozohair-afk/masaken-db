import UnitDetailsPageClient from './UnitDetailsPageClient';

export const runtime = 'edge';
export const dynamic = 'force-dynamic';

export default async function Page({ params }: { params: Promise<{ id: string }> }) {
  const { id } = await params;
  return <UnitDetailsPageClient id={id} />;
}
