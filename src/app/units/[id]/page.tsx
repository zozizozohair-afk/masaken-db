import UnitDetailsPageClient from './UnitDetailsPageClient';

export const runtime = 'edge';

export default function Page({ params }: { params: Promise<{ id: string }> }) {
  return <UnitDetailsPageClient params={params} />;
}
